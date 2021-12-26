using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace template_wpf.common
{
    /// <summary>
    /// Логика взаимодействия для CommonWindow.xaml
    /// </summary>
    public partial class CommonWindow : Window
    {
        private Page _currentPage;
        public Page CurrentPage
        {
            get { return _currentPage; }
            set
            {
                if (_currentPage == value)
                    return;

                _currentPage = value;
                OnPropertyChanged("CurrentPage");
            }
        }

        public event PropertyChangedEventHandler PropertyChanged;
        protected virtual void OnPropertyChanged(string propertyName)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }

        public CommonWindow()
        {
            InitializeComponent();
        }

        public void setPage(Page page)
        {
            CurrentPage = page;
            PageFrame.Content = CurrentPage;
            windowToFitPage();
        }

        private void windowToFitPage()
        {
            if (CurrentPage.Width >= Width)
                Width = CurrentPage.Width + 20;
            if (CurrentPage.Height >= Height)
                Height = CurrentPage.Height + 40;
        }
    }
}
