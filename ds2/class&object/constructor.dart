class CarModel {
  String? name;
  String? model;
  String? year;
  String? variant;

//  ONE TYPE CONSTRUCTOR
  // CarModel(String n, String m, String y, String v) {
  //   this.name = n; ====== >>>  THIS IS USED TO REFFER THE VARIABLE AS THE CURRENT CLASS/OBJECT
  //   this.model = m;
  //   this.year = y;
  //   this.variant = v;
  // }

  // ANOTHER TYPE CONSTRUCTOR

  CarModel(this.name, this.model, this.year, [this.variant = 'sedaN']) {
    //  OPTIONAL PARAMETER [this.variant] >> NULL(RESULT),   [this.variant='sedaN] >> sedaN WILL BE THE DEFAULT VALUE TO THE VARIANT FIELD(RESULT)

//     >>>  THIS IS USED TO REFFER THE VARIABLE AS THE CURRENT CLASS/OBJECT
  }

  void display() {
    print('CAR : ${this.name}');
    print('MODEL : $model');
    print('YEAR : $year');
    print('VARIANT : $variant');
  }
}

void main() {
  CarModel car = CarModel(
    'BMW',
    'M%5',
    '2009',
  );
  car.display();
}
