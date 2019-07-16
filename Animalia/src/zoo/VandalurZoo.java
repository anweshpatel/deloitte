package zoo;

import org.animals.Elephant;
import org.animals.Lion;
import org.animals.Monkey;

public class VandalurZoo {
	public static void main(String[] args) {
		System.out.println("This is vandalur zoo");
		
		//Lions
		Lion lion = new Lion();
		System.out.println("Lion - colour : "+lion.color+" weight : "+lion.weight+" age : "+lion.age);
		
		System.out.println("Eats ");
		lion.isVegetarian();
		
		System.out.println("Can climb?");
		lion.canClimb();
		
		System.out.println("Sounds");
		lion.getSound();
		
		//Monkeys
		Monkey monkey = new Monkey();
		System.out.println("Monkey - colour : "+monkey.color+" weight : "+monkey.weight+"age : "+monkey.age);
		
		System.out.println("Eats");
		monkey.isVegetarian();
		
		System.out.println("Can climb?");
		monkey.canClimb();
		
		System.out.println("Sounds");
		monkey.getSound();
		
		//Elephants
		Elephant elephant = new Elephant();
		System.out.println("Elephant - colour : "+elephant.color+" weight : "+elephant.weight+" age: "+elephant.age);
		
		System.out.println("Eats");
		elephant.isVegetarian();
		
		System.out.println("Can climb?");
		elephant.canClimb();
		
		System.out.println("Sounds");
		elephant.getSound();
	}
}
