using Caliburn.Micro;
using events4me.Assets;
using events4me.ViewModels;

namespace events4me
{
    public class MainPageViewModel : Screen
    {
        readonly INavigationService navigationService;

        public MainPageViewModel(INavigationService navigationService)
        {
            this.navigationService = navigationService;

            if (!string.IsNullOrEmpty(Helpers.Extensions.RetrieveToken()))
                this.navigationService.UriFor<HomeViewModel>().Navigate();
        }

        public void SignIn()
        {
            navigationService.UriFor<LoginViewModel>()
                .WithParam(c => c.PageTitle, Resources.SignInText)
                .WithParam(c => c.Source, Resources.SignInURL)
                .Navigate();
        }

        public void SignUp()
        {
            navigationService.UriFor<LoginViewModel>()
                .WithParam(c => c.PageTitle, Resources.SignUpText)
                .WithParam(c => c.Source, Resources.SignUpURL)
                .Navigate();
        }
    }
}
