package com.pms.deloitte.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.pms.deloitte.model.Person;


public interface PersonService {

	public void addPerson(Person p);
	public void updatePerson(Person p);
	public List<Person> listPersons();
	public Person getPersonById(Integer  id);
	public void removePerson(int id);
	
}
