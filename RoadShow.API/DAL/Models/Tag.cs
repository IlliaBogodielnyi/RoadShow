using System;
using System.Collections.Generic;

namespace RoadShow.API.DAL.Models;

public partial class Tag
{
    public long TagId { get; set; }

    public string Name { get; set; } = null!;
}
