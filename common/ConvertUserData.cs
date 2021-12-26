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
    [ValueConversion(typeof(user), typeof(string))]
    public class ConvertUserData : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            user employee = (user)value;
            if (employee == null)
                return "";

            return $"@{(employee.bithday == null ? "" : employee.bithday.ToString())}:{employee.login.Trim()}";
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            return value;
        }
    }
}
