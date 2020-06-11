package com.stackroute.keepnote.repository;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import com.stackroute.keepnote.model.Note;

/*
 * This class contains the code for data storage interactions and methods 
 * of this class will be used by other parts of the applications such
 * as Controllers and Test Cases
 * */

public class NoteRepository {

	/* Declare a variable called "list" to store all the notes. */
	List<Note> notes;

	public NoteRepository() {

		/* Initialize the variable using proper data type */
		notes = new ArrayList<>();
	}

	/* This method should return all the notes in the list */

	public List<Note> getList() {
		return notes;
	}

	/* This method should set the list variable with new list of notes */

	public void setList(List<Note> notes) {
		this.notes = notes;	
	}

	/*
	 * This method should Note object as argument and add the new note object into
	 * list
	 */

	public void addNote(Note note) {
		notes.add(note);
	}

	/* This method should deleted a specified note from the list */

	public boolean deleteNote(int noteId)
	{
		/* Use list iterator to find matching note id and remove it from the list */
		Optional<Note> optional = notes.stream().filter(note -> note.getNoteId() == noteId).findAny();
		
		if(optional.isPresent())
		{
			notes.remove(optional.get());
			return true;
		}
		
		return false;
	}

	/* This method should return the list of notes */

	public List<Note> getAllNotes() {
		return notes;
	}

	/*
	 * This method should check if the matching note id present in the list or not.
	 * Return true if note id exists in the list or return false if note id does not
	 * exists in the list
	 */

	public boolean exists(int noteId) 
	{
		Optional<Note> optional = notes.stream().filter(note -> note.getNoteId() == noteId).findAny();
		
		return optional.isPresent()?true:false;
	}
}