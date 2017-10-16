#!/bin/bash

echo "Welcome to Dumb Exit! :D"
echo ""

random_array_size=10;
random_lower_limit=${EXIT_CODE_LOWER_LIMIT:-1};
random_upper_limit=${EXIT_CODE_UPPER_LIMIT:-200};

wait_lower_limit=${WAIT_LOWER_LIMIT:-10};
wait_upper_limit=${WAIT_UPPER_LIMIT:-60};
exit_code=${EXIT_CODE};

if [ ! -z ${exit_code} ];
then
  echo "Exiting with custom exit code: ${exit_code}";
  exit ${exit_code};
fi;

# Fill array with random numbers
i=1;
while [ "$i" -le $random_array_size ]; do
 random_array[$i]=$(shuf -i ${random_lower_limit}-${random_upper_limit} -n 1)
 let "i += 1"
done

# Fill 50% of the array with 0s, to make probability of 0 50%
i=1;
while [ "$i" -le $(($random_array_size / 2)) ]; do
  random_index=$(shuf -i 0-${random_array_size} -n 1);
  random_array[$random_index]=0;
  let "i += 1"
done

# Sleep for random number of seconds between 10-120
random_sleep=$(shuf -i ${wait_lower_limit}-${wait_upper_limit} -n 1);
while [ $random_sleep -gt 0 ]; do
   echo "Exiting in ................ $random_sleep"
   sleep 1
   : $((random_sleep--))
done

echo ""
# Exit with random exit code (probability of 0 50%)
random_index=$(shuf -i 0-${random_array_size} -n 1);
exit_code=${random_array[$random_index]}
echo "Exiting with code: ${exit_code}"
exit ${exit_code};