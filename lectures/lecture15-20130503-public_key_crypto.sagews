︠d29f5555-88a9-4e03-b167-55ddcd1857fdi︠
%hide
%md

# Lecture 15: Some Public-Key Cryptography

1. Remember to start G+ recorder
2. Questions?
3. public-key crypto
︡e1d69277-66ea-4ca5-a465-675e55f0e5df︡{"html":"<h1>Lecture 15: Some Public-Key Cryptography</h1>\n\n<ol>\n<li>Remember to start G+ recorder</li>\n<li>Questions?</li>\n<li>public-key crypto</li>\n</ol>\n"}︡
︠a7f27611-4038-4708-8dbd-a2ccc6c49e48i︠
%hide
%md

### Different style today

- I'm going to describe the Diffie-Hellman key exchange mathematically, then together we
  will step-by-step figure out how to implement this from scratch in Sage.

- Then we'll do the same with RSA.
︡97cd447e-f75c-4ee5-9e74-bc4e242a99d8︡{"html":"<h3>Different style today</h3>\n\n<ul>\n<li><p>I&#8217;m going to describe the Diffie-Hellman key exchange mathematically, then together we\nwill step-by-step figure out how to implement this from scratch in Sage.</p></li>\n<li><p>Then we&#8217;ll do the same with RSA.</p></li>\n</ul>\n"}︡
︠dd49a57a-f6a0-486c-a6de-a5d5ee3debb3i︠
%hide
%md
# The Diffie-Hellman key exchange
︡6541f0c0-9e50-4adb-93b1-6857f19f4b3a︡
︠a5c18630-1c5a-4778-b4c4-99adacd653f3︠
%hide
%md
# The Diffie-Hellman key exchange

- Diffie-Hellman is a seemingly trivial observation that *changed the world*.

- It shocked people.  It was at first not believed possible!

- For many millenia, people have used a vast range of methods for sharing secrets, political intrigue, shaved/tatooed heads, ciphers, enigma machines, couriers, etc....

- Today, one little observation involving arithmetic with numbers modulo $n$ completely renders all of that defunct.

- This little idea makes buying things on a computer *possible*.   If you visit a URL that has "https:" in it, then you probably using either Diffie-Hellman (or RSA).  See <http://security.stackexchange.com/questions/20803/how-does-ssl-work>.


︡f188e53e-f55e-48eb-bb09-4be25b0e842b︡{"html":"<h1>The Diffie-Hellman key exchange</h1>\n\n<ul>\n<li><p>Diffie-Hellman is a seemingly trivial observation that <em>changed the world</em>.</p></li>\n<li><p>It shocked people.  It was at first not believed possible!</p></li>\n<li><p>For many millenia, people have used a vast range of methods for sharing secrets, political intrigue, shaved/tatooed heads, ciphers, enigma machines, couriers, etc&#8230;.</p></li>\n<li><p>Today, one little observation involving arithmetic with numbers modulo $n$ completely renders all of that defunct.</p></li>\n<li><p>This little idea makes buying things on a computer <em>possible</em>.   If you visit a URL that has &#8220;https:&#8221; in it, then you probably using either Diffie-Hellman (or RSA).  See <a href=\"http://security.stackexchange.com/questions/20803/how-does-ssl-work\">http://security.stackexchange.com/questions/20803/how-does-ssl-work</a>.</p></li>\n</ul>\n"}︡
︠5b561bba-8f02-46d7-98c0-e16732b5560c︠
%hide
%html
<img src="http://images.buddytv.com/articles/Nikita%203-16.jpg" class="pull-right img-rounded" style="width:30%;">

︡13b8254c-25cd-45b7-97cd-8ec08954949e︡{"html":"<img src=\"http://images.buddytv.com/articles/Nikita%203-16.jpg\" class=\"pull-right img-rounded\" style=\"width:30%;\">"}︡
︠0564e221-dbd2-4db6-ad0b-86d52c941eebi︠
%hide
%md
## Diffie-Hellman: here it is


Problem: Suppose Michael and Nikita would like to both know a shared random number, which they can both use to encrypt messages to each other.  Unfortunately, **all** of their communications are being closely watched.

1. Michael and Nikita agree on a large random prime number $p$.  (Everybody knows $p$.)

2. Michael secretly generates a random number $m$ and computes then messages Nikita (and hence everybody) the number
$2^m\pmod{p}$.

3. Nikita secretly generates a random number $n$ and computes then messages Michael (hence everybody) the number $2^n\pmod{p}$.

4. Both Michael and Nikita can now **easily** compute $2^{mn}\pmod{p}$, but nobody else can.  This
is because $2^{mn} = (2^m)^n = (2^n)^m$.








︡dd4772a7-67e7-4831-a306-66ee7d0e4385︡{"html":"<h2>Diffie-Hellman: here it is</h2>\n\n<p>Problem: Suppose Michael and Nikita would like to both know a shared random number, which they can both use to encrypt messages to each other.  Unfortunately, <strong>all</strong> of their communications are being closely watched.</p>\n\n<ol>\n<li><p>Michael and Nikita agree on a large random prime number $p$.  (Everybody knows $p$.)</p></li>\n<li><p>Michael secretly generates a random number $m$ and computes then messages Nikita (and hence everybody) the number\n$2^m\\pmod{p}$.</p></li>\n<li><p>Nikita secretly generates a random number $n$ and computes then messages Michael (hence everybody) the number $2^n\\pmod{p}$.</p></li>\n<li><p>Both Michael and Nikita can now <strong>easily</strong> compute $2^{mn}\\pmod{p}$, but nobody else can.  This\nis because $2^{mn} = (2^m)^n = (2^n)^m$.</p></li>\n</ol>\n"}︡
︠165f8ab3-0b72-4a56-96a1-eb42485f0efa︠
# Let's implement this: how?


︠4d9ecea2-2839-46b0-8f01-9c136bcdc467︠

︠5b038534-4944-44d0-8cad-727d9541f968︠

︠6d6f9bfe-b9bb-4a01-a1d3-4b550eeca25a︠

︠3304677b-4ec5-4069-8245-594a146e9a8b︠

︠55a03652-14bd-4c34-9a41-ad588b83f9fbi︠
%hide
%html

<img src="http://static.tvfanatic.com/images/gallery/dr-hanson-and-alex_500x332.jpg" class="img-rounded" style="width:30%;">&nbsp;&nbsp;
<img src="http://0.static.wix.com/media/3557ea_e15a7612089a99e9f628dd59c7751b23.jpg_1024" class="img-rounded" style="width:30%">
</center>
<img src="http://1.bp.blogspot.com/_9VadMyosXXU/TLauxaGDieI/AAAAAAAAAcY/mXfzrsEet1E/s1600/nikita+season+1+episode+6.jpg" class="pull-right img-rounded" style="width:30%;">
︡ec00d21a-00bc-438e-9477-cfe9a9b14d42︡{"html":"\n<img src=\"http://static.tvfanatic.com/images/gallery/dr-hanson-and-alex_500x332.jpg\" class=\"img-rounded\" style=\"width:30%;\">&nbsp;&nbsp;\n<img src=\"http://0.static.wix.com/media/3557ea_e15a7612089a99e9f628dd59c7751b23.jpg_1024\" class=\"img-rounded\" style=\"width:30%\">\n</center>\n<img src=\"http://1.bp.blogspot.com/_9VadMyosXXU/TLauxaGDieI/AAAAAAAAAcY/mXfzrsEet1E/s1600/nikita+season+1+episode+6.jpg\" class=\"pull-right img-rounded\" style=\"width:30%;\">"}︡
︠803fafea-cddd-469c-ae25-d58ff16ca032i︠
%hide
%md
Diffie-Hellman has some significant drawbacks.  It takes active involvement by both parties.

# The RSA public-key cryptosystem

Problem: Nikita wants to make it easy for her spy Alex (who she has sent to infiltrate Division) to send her secret messages and any point.  What could she do (years earlier) that will make this possible?

1. Nikita chooses two random large prime numbers $p$ and $q$ and computes $n=pq$.
2. Nikita computes a random integer $e < n$.
3. Nikita computes an integer $d$ such that $ed\equiv 1\pmod{p-1}{q-1}$.
4. Nikita tells everybody $n$ and $e$, but deletes $p$ and $q$, and keeps $d$ secret (memorized).
4. To send Nikita a secret message, encode it as an integer $m < n$, and send her $m^e\pmod{n}$.
5. Nikita later decrypts a secret message $m$ by computing $m = (m^e)^d \pmod{n}$.


This works because of the structure of the group $(\mathbb{Z}/ n\mathbb{Z})^*$.

This setup will last and all messages will stay "unbreakable" so long as nobody else ever figures out how to factor $n$.

(Note: on the first episode of *Nikita*, a character named Birkhoff claims he can hack any encryption quickly, etc.,  but on many subsequent episodes he is completely unable to hack many different types of encryption.  Maybe the writers hired a less clueless technical consultant!)


︡f27a31f4-89fc-4d5d-bd75-86313974241d︡{"html":"<p>Diffie-Hellman has some significant drawbacks.  It takes active involvement by both parties.</p>\n\n<h1>The RSA public-key cryptosystem</h1>\n\n<p>Problem: Nikita wants to make it easy for her spy Alex (who she has sent to infiltrate Division) to send her secret messages and any point.  What could she do (years earlier) that will make this possible?</p>\n\n<ol>\n<li>Nikita chooses two random large prime numbers $p$ and $q$ and computes $n=pq$.</li>\n<li>Nikita computes a random integer $e &lt; n$.</li>\n<li>Nikita computes an integer $d$ such that $ed\\equiv 1\\pmod{p-1}{q-1}$.</li>\n<li>Nikita tells everybody $n$ and $e$, but deletes $p$ and $q$, and keeps $d$ secret (memorized).</li>\n<li>To send Nikita a secret message, encode it as an integer $m &lt; n$, and send her $m^e\\pmod{n}$.</li>\n<li>Nikita later decrypts a secret message $m$ by computing $m = (m^e)^d \\pmod{n}$.</li>\n</ol>\n\n<p>This works because of the structure of the group $(\\mathbb{Z}/ n\\mathbb{Z})^*$.</p>\n\n<p>This setup will last and all messages will stay &#8220;unbreakable&#8221; so long as nobody else ever figures out how to factor $n$.</p>\n\n<p>(Note: on the first episode of <em>Nikita</em>, a character named Birkhoff claims he can hack any encryption quickly, etc.,  but on many subsequent episodes he is completely unable to hack many different types of encryption.  Maybe the writers hired a less clueless technical consultant!)</p>\n"}︡
︠2628f39c-2ac4-4c37-88cf-c372488e231d︠

# Let's implement this: how?

︡a4efbe2c-0361-46ae-8871-7b8c9494c570︡
︠a404c405-ed3a-4e86-86a1-1d93c99e54c7︠




















