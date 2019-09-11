using DevopsWorld.Client.Controllers;
using Microsoft.AspNetCore.Mvc;
using Xunit;

namespace DevopsWorld.Tests
{
  public class HomeUnitTest
  {
    [Fact]
    public void TestIndex()
    {
      var sut = new HomeController();
      var view = sut.Index();
      
      Assert.NotNull(view);
      Assert.IsType<ViewResult>(view);
    }

    [Fact]
    public void TestPrivacy()
    {
      var sut = new HomeController();
      var view = sut.Privacy();
      
      Assert.NotNull(view);
    }
  }
}