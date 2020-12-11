using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Notes.Api.Models
{
    public class Note
    {
        public int Id { get; set; }

        public string Tag { get; set; }

        public DateTime Date { get; set; }

        public string Content { get; set; }

        public int Size => Content.Length;
    }
}
