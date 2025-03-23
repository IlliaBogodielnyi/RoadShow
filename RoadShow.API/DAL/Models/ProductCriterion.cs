using System;
using System.Collections.Generic;

namespace RoadShow.API.DAL.Models;

public partial class ProductCriterion
{
    public long ProductId { get; set; }

    public long CriteriaId { get; set; }

    public string CrtieriaValue { get; set; } = null!;

    public virtual Criterion Criteria { get; set; } = null!;

    public virtual Product Product { get; set; } = null!;
}
