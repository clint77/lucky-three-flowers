String.prototype.isFactor = function (n) {
  return this / n == Math.round(this / n)
}
