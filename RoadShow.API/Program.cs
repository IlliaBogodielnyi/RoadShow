using Microsoft.EntityFrameworkCore;
using RoadShow.API.DAL;

var builder = WebApplication.CreateBuilder(args);
string connectionString = "Server=DESKTOP-S5TAQ6L\\SQLEXPRESS; Database=roadshow_db; TrustServerCertificate=True; Integrated Security=True";
                          //"Server = localhost; Database=roadshow_db; User=sa; Password=1q @W3e4r5t;";
                          // Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

builder.Services.AddDbContext<RoadshowDbContext>(options =>
    options.UseSqlServer(connectionString));

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
