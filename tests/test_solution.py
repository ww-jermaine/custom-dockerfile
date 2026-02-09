def test_fib_base_cases():
    from solution import fibonacci
    assert fibonacci(0) == 0
    assert fibonacci(1) == 1


def test_fib_small():
    from solution import fibonacci
    assert fibonacci(5) == 5
    assert fibonacci(10) == 55


def test_fib_larger():
    from solution import fibonacci
    assert fibonacci(20) == 6765
