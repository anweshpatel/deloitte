package com.pms.deloitte.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pms.deloitte.dao.PersonDAO;
import com.pms.deloitte.model.Person;

@Service("personService")
public class PersonServiceImpl implements PersonService {
	
	@Autowired
	private PersonDAO personDAO;

	public void setPersonDAO(PersonDAO personDAO) {
		this.personDAO = personDAO;
	}

	@Override
	@Transactional
	public void addPerson(Person p) {
		this.personDAO.save(p);
	}

	@Override
	@Transactional
	public void updatePerson(Person p) {
		this.personDAO.save(p);
	}

	@Override
	@Transactional
	public List<Person> listPersons() {
		return (List<Person>) this.personDAO.findAll();
	}

	@Override
	@Transactional
	public Person getPersonById(Integer id) {
		Optional<Person> person = this.personDAO.findById(id);
		if(person.isPresent())
		{
			return person.get();
		}
		else
		{
			return null;
		}
	}

	@Override
	@Transactional
	public void removePerson(int id) {
		Person person = new Person();
		person.setId(id);
		this.personDAO.delete(person);
	}


}
