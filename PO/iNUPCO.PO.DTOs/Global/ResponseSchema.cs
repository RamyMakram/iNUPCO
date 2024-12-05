﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace iNUPCO.PO.DTOs.Global
{
    public record ResponseSchema(bool IsSuccess, object Data, int StatusCode, string? ErrorMessage = null);
}