#include <cstdio>
#include <algorithm>

using namespace std;

const int MAXN = 100100;
const long long MOD = 1000000007;

long long extGcd(long long a, long long b, long long& x, long long& y) {
	if (b == 0) {
		x = 1;
		y = 0;
		return a;
	} else {
		int g = extGcd(b, a % b, y, x);
		y -= a / b * x;
		return g;
	}
}

long long modInv(long long a, long long m) {
	long long x, y;
	extGcd(a, m, x, y);
	x %= m;
	while (x < 0) {
		x += m;
	}
	return x;
}

int main() {
	int n;
	long long ans = 1;

	scanf("%d", &n);
	for (int i = 1; i <= n; ++i) {
		ans *= n + i - 1;
		ans %= MOD;
		ans *= modInv(i, MOD);
		ans %= MOD;
	}
	ans = (ans * 2 - n) % MOD;
	while (ans < 0) {
		ans += MOD;
	}
//	printf("%lld\n", ans);
	printf("%d\n", (int)ans);

	return 0;
}

