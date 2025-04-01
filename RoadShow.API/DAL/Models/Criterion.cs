using System;
using System.Collections.Generic;

namespace RoadShow.API.DAL.Models;

public partial class Criterion
{
    public long CriteriaId { get; set; }

    public string Name { get; set; } = null!;

    public int? CriteriaRank { get; set; }

    public virtual ICollection<ProductCriterion> ProductCriteria { get; set; } = new List<ProductCriterion>();
}
