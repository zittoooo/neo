int checkprime(int x) {
    int i;
    for (i = 2; i < x; i++) {
        if (x % i == 0)
            break;
        else
            continue;
    }
    return i;
}