from lpnorm import lp_norm
import numpy as np

array = np.random.rand(100) * 100 - 50

for p in range(1, 101):
    computed_norm = lp_norm(array, p)
    expected_norm = np.linalg.norm(array, p)
    assert np.isclose(computed_norm, expected_norm), f"Test failed: {computed_norm} != {expected_norm}"

print('Successfully tested')
