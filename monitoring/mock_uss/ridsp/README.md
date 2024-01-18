When this `ridsp` [mock_uss](..) functionality is enabled, mock_uss will behaves like an RID Service Provider  which accepts input flight data (as would normally come from an operator) via the [InterUSS RID automated testing interface](../../../interfaces/automated_testing/rid) injection API, and then communicates this data to applicable consumers via ASTM
F3411-19 or ASTM F3411-22a.  Its Service Provider behavior can also be controlled via an ad-hoc interface.