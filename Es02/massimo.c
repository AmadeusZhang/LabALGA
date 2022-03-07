long long massimo(long long a[], long long n)
{
    long long i, max;
    max = -9223372036854775808LL;   // 1e63
    for (i = 0; i < n; ++i)
    {
        if (max < a[i])
            max = a[i];
    }
    return max;
}