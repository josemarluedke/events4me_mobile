using Caliburn.Micro;
using events4me.Assets;
using events4me.Helpers;
using Microsoft.Phone.Controls;

namespace events4me.ViewModels
{
    public class LoginViewModel : ViewModelBase
    {
        readonly INavigationService NavigationService;

        public LoginViewModel(INavigationService navigationService)
        {
            this.NavigationService = navigationService;
        }

        private string pageName;
        public string PageTitle
        {
            get { return pageName; }
            set
            {
                pageName = value;
                NotifyOfPropertyChange(() => PageTitle);
            }
        }

        private string source;
        public string Source
        {
            get { return source; }
            set
            {
                source = value;
                NotifyOfPropertyChange(() => Source);
            }
        }

        public void BrowserNavigating(WebBrowser sender, NavigatingEventArgs e)
        {
            if (e.Uri.Query.Contains("auth_token"))
            {

                string[] val = e.Uri.Query.Split(new[] { '=', '&' });
                var token = val[1];

                AppSettings.StoreSetting(Resources.TokenParameter, token);
                NavigationService.UriFor<HomeViewModel>().Navigate();
            }

        }
    }
}
