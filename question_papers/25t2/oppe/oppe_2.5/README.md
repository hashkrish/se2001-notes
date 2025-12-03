# Linux OPPE Question - Section 1 - Question 5

## Motivation

### Associative Arrays

In `awk`, associative arrays are a powerful feature that allows you to
store and retrieve key-value pairs. This is particularly useful for tasks like
frequency counting, data aggregation, and more complex data manipulations.

```bash
gawk '{
    for (i = 1; i <= NF; i++) {
        count[$i]++;
    }
}
END {
    for (word in count) {
        print word, count[word];
    }
}' input.txt
```

Here the keys are the words in each column, similarly the column number can also
be used as the key, and the value can be the sum of the values in that column.

## Problem Statement

You are working for a factory that produces widgets. The production output is
recorded in a CSV file where each row represents a week, and the columns
represent the production output for each day of the week (Monday to Sunday).

The factory works for 7 days a week, and 52 days a year.

Process the CSV file to find the average production for each week and the average
production for each day of the week. The output should include a new column at
the end of each row for the average production of that week, and a new row at the
end of the CSV for the average production of each day in that order.

## Instructions

- Write your solution in `script.awk` GNU Awk script file.
- The script should be executable by the `gawk` command.

The script will be executed as follows:

```bash
gawk -f script.awk < input.csv
```

## Sample Input

```text
100,150,200,255,300,350,400
110,160,210,260,310,360,410
120,170,220,270,320,370,420
130,180,230,280,330,380,430
```

## Sample Output

```text
100,150,200,255,300,350,400,250.714
110,160,210,260,310,360,410,260
120,170,220,270,320,370,420,270
130,180,230,280,330,380,430,280
115,165,215,266.25,315,365,415

```

## Constraints

- Do not expect or produce any headers in the CSV file.
- The CSV file is comma-separated, and LF (`\n`) terminated.
- The values are not quoted, and are always non-empty integers.
- There are always 7 columns in each row, one for each day of the week.
- The number of rows can vary, but there will always be at least one row.
- Print decimals in the default gawk precision as shown in the sample output.
- A line should always end with a newline character.
