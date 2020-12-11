using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Notes.Api.Models
{
    public class User : IUser
    {
        public int Id { get; set; }

        public string Name { get; set; }

        private readonly ISet<Note> _notes = new HashSet<Note>();

        public IReadOnlySet<Note> Notes => new HashSet<Note>(_notes);

        public bool AddNote(Note note)
        {
            return true;
        }

    }
}
