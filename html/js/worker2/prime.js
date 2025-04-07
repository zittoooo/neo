function Prime(num) {
  if (num < 2)
    return false;
  for (let i = 2; i < num / 2; i++) {
    if (num % i == 0) return false;
  }
  return true;
}

self.onmessage = function(e) {
  // work task로 부터 전달받은 숫자
  let num = e.data.input;
  output = num
  output += (Prime(num)) ? " is PrimeNumber" : " is not PrimeNumber"
  self.postMessage(output);
}