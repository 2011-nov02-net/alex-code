using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Notes.Api.Models
{
    interface IUser
    {
        public int Id { get; set; }

        public string Name { get; set; }
    }
}
