void main() {
  solution([4, 1, -2, -3]);
}

void solution(List<int> numbers) {
  var small = 0;

  for (var i = 0; i < numbers.length; i++) {
    if (small > numbers[i]) {
      small = numbers[i];
    }
  }

  print(small);
}
