﻿using System;
using System.Collections.Generic;

namespace RoadShow.API.DAL.Models;

public partial class Vendor
{
    public long VendorId { get; set; }

    public string Name { get; set; } = null!;

    public virtual ICollection<Product> Products { get; set; } = new List<Product>();
}
