using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Data;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using template_wpf.db;

namespace template_wpf.common
{
    [ValueConversion(typeof(user), typeof(ImageSource))]
    public class ConvertImage : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            user employee = (user)value;
            if (employee == null)
                return null;
            return new BitmapImage(new Uri(System.IO.Path.GetFullPath($"../../Resources/pic/{employee.user_role.name}.png")));
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            return value;
        }
    }
}
