using System;
using System.Collections.Generic;

namespace RoadShow.API.DAL.Models;

public partial class Product
{
    public long ProductId { get; set; }

    public long? ProductLineId { get; set; }

    public long VendorId { get; set; }

    public string Name { get; set; } = null!;

    public string? ShortDescription { get; set; }

    public virtual ICollection<ProductCriterion> ProductCriteria { get; set; } = new List<ProductCriterion>();

    public virtual ProductLine? ProductLine { get; set; }

    public virtual Vendor Vendor { get; set; } = null!;
}
