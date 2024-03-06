class CarModel {
  String? name;
  String? model;
  String? year;
  String? variant;

  CarModel({
    required this.name,
    required this.model,
    required this.year,
    required this.variant,
  });

  void display() {
        print('\n');
    print('CAR : ${this.name}');
    print('MODEL : $model');
    print('YEAR : $year');
    print('VARIANT : $variant ');
    print('\n');
  }
}

void main() {
  CarModel car =
      CarModel(name: 'BENZ', model: 'AMG', year: '2010', variant: 'SEDAN');
  car.display();

  CarModel car1 =
      CarModel(name: 'BMW', model: 'M5', year: '2012', variant: 'COUPE');
  car1.display();
}
