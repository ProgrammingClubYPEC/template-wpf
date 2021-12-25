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
    public class ConvertUserName : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            user employee = (user)value;
            if (employee == null)
                return "";

            return $"@{employee.user_role.name.Trim()}: {employee.surname.Trim()} {employee.name.Trim()} {(employee.midname == null ? "" : employee.midname.Trim())}";
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            return value;
        }
    }
}
