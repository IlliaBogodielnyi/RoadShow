using System;
using System.Collections.Generic;

namespace RoadShow.API.DAL.Models;

public partial class ProductLine
{
    public long ProductLineId { get; set; }

    public string Name { get; set; } = null!;

    public virtual ICollection<Product> Products { get; set; } = new List<Product>();
}
