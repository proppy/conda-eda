import apfloat

type F8 = apfloat::APFloat<4, 3>;

#[test]
fn cast_test() {
  let fixed1 = s8:1;
  let float1 = apfloat::cast_from_fixed_using_rne<u32:4, u32:3>(fixed1);
  assert_eq(
    apfloat::cast_to_fixed<u32:8, u32:4, u32:3>(float1),
    fixed1
  )
}
