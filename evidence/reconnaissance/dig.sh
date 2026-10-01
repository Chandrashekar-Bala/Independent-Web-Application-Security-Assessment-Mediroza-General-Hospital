export TARGET="medirozahospital.com"
export URL="https://medirozahospital.com"

echo "$TARGET"
echo "$URL"
{
dig "$TARGET" A +noall +answer
dig "$TARGET" AAAA +noall +answer
dig "$TARGET" MX +noall +answer
dig "$TARGET" NS +noall +answer
dig "$TARGET" TXT +noall +answer

}
