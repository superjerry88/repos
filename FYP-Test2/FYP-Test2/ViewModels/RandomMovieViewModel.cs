using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using FYP_Test2.Models;

namespace FYP_Test2.ViewModels
{
    public class RandomMovieViewModel
    {
        public Movie Movie { get; set; }
        public List<Customer> Customers { get; set; }
    }
}