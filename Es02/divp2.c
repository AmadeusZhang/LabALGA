long long divp2( long long x, long long exp)
{
    long long res = x >> exp;
    if ( x < 0 )
    {
        res += ( x & ((1LL << exp) -1)) != 0;
    }

    return res;
}