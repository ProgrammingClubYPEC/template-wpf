using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Data;
using template_wpf.db;

namespace template_wpf.common
{
    [ValueConversion(typeof(user_role), typeof(string))]
    public class ConvertUserRole : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            user_role role = (user_role)value;
            if (role == null)
                return "";

            return $"#{role.code_role}:{role.name}";
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            return value;
        }
    }
}
