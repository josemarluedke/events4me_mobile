
using events4me.Assets;
namespace events4me.Helpers
{
    public static class Extensions
    {
        public static string RetrieveToken()
        {
            string token;
            if (AppSettings.TryGetSetting(Resources.TokenParameter, out token))
                return token;
            return string.Empty;
        }
    }
}
