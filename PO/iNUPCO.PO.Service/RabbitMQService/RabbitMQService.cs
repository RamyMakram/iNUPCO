using iNUPCO.PO.DTOs.Global;
using iNUPCO.PO.Service.PODocumentService;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Options;
using RabbitMQ.Client;
using RabbitMQ.Client.Events;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Channels;
using System.Threading.Tasks;

namespace iNUPCO.PO.Service.RabbitMQService
{
    public class RabbitMQService : BackgroundService
    {
        private readonly string _queueName;
        private readonly string _exchangeName;
        private readonly string _routingKey;
        private readonly ConnectionFactory _connectionFactory;
        private IConnection connection;
        private IChannel channel;
        private readonly IServiceProvider _serviceProvider;

        public RabbitMQService(IOptions<RabbitMQSettings> options, IServiceProvider serviceProvider)
        {
            var settings = options.Value;

            _queueName = settings.QueueName;
            _exchangeName = settings.ExchangeName;
            _routingKey = settings.RoutingKey;

            _connectionFactory = new ConnectionFactory
            {
                HostName = settings.HostName,
                UserName = settings.UserName,
                Password = settings.Password,
                Port = 5672
            };
            _serviceProvider = serviceProvider;
        }
        protected override async Task<Task> ExecuteAsync(CancellationToken stoppingToken)
        {
            stoppingToken.ThrowIfCancellationRequested();

            try
            {
                connection = await _connectionFactory.CreateConnectionAsync();
                channel = await connection.CreateChannelAsync();

                // Declare exchange and queue
                await channel.ExchangeDeclareAsync(_exchangeName, ExchangeType.Direct, durable: true);
                await channel.QueueDeclareAsync(_queueName, durable: true, exclusive: false, autoDelete: false);
                await channel.QueueBindAsync(_queueName, _exchangeName, _routingKey);

                var consumer = new AsyncEventingBasicConsumer(channel);
                consumer.ReceivedAsync += async (model, eventArgs) =>
                {
                    var body = eventArgs.Body.ToArray();
                    var message = Encoding.UTF8.GetString(body);
                    Console.WriteLine($"Received: {message}");
                    // Acknowledge the message
                    int.TryParse(message, out int POID);
                    using (var scope = _serviceProvider.CreateScope())
                    {
                        var poService = scope.ServiceProvider.GetRequiredService<IPOService>();
                        poService.ChangeState(POID);
                    }

                    await channel.BasicAckAsync(deliveryTag: eventArgs.DeliveryTag, multiple: false);

                };

                await channel.BasicConsumeAsync(queue: _queueName, autoAck: false, consumer: consumer);

            }
            catch (Exception ee)
            {

                throw;
            }
            return Task.CompletedTask;
        }
        public override async Task StopAsync(CancellationToken cancellationToken)
        {
            await channel.CloseAsync();
            await connection.CloseAsync();
            await base.StopAsync(cancellationToken);
        }
    }
}
