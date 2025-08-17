fn main() {
    println!("Hello, world!");
    another_function();
    func2(5);
    func3(5, 'h');
    func4();

}

fn another_function() {
    println!("Another function.");
}

fn func2(x: i32) {
    println!("The value of x is: {x}");
}

fn func3(value: i32, unit_label: char) {
    println!("The measurement is: {value}{unit_label}");
}

fn func4() -> i32 {
    4
}
