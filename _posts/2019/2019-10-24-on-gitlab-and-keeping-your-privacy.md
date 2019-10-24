---
layout:             post
title:              On GitLab and keeping your privacy on the modern Web
---

> TL;DR: If you are a privacy-conscious technical person, use [uMatrix][uMatrix] (or an alternative) and consider switching to [SourceHut.org][SourceHut].

**GitLab** has [upset hackers](https://news.ycombinator.com/item?id=21337594) with their [telemetry announcement](https://gitlab.com/gitlab-com/www-gitlab-com/blob/d3454a729d24025b2c31ca423672f8951062af93/source/posts/2019-10-10-update-free-software-and-telemetry.html.md.erb). They have (wisely) back-tracked from it, but I don't believe they changed their heart _yet_.

I think this telemetry scandal was bound to happen. I have been expecting it since the day **GitHub** was bought by **Microsoft**. I evalued my options with **GitLab** that day. **GitLab** wasn't respecting user privacy then and it has not changed since.

Let me explain.

* Lets go to the websites [that I know best] for hosting your open-source code.
* Lets use [uMatrix][uMatrix] extension for [Firefox][Firefox] and see what technologies from which domains are used.


### GitHub

<p><img src="/static/2019/github-umatrix.png" class="full"></p>

* Works **without JavaScript** – <span class="label-green">good</span>.
* Tries to set **4 cookies** without asking me first: <span class="label-yellow">not nice</span>.
* **No third-party** resources on page – <span class="label-green">great</span>.

Seems that they can take care of themselves without third parties involved.

**Note:** now owned by a corporation that mainstreamed [vacuuming data from paying customers][MsTelemetry] (telemetry).


### SourceForge

<p><img src="/static/2019/sourceforge-umatrix.png" class="full"></p>

* Works **without JavaScript** – <span class="label-green">good</span>.
* Tries to set **1 cookie** without asking me first: <span class="label-yellow">not nice</span>.
* Third parties:
	* **fsdn.com** Assuming it is owned by the same company. No way to check, because their Whois info is private. – <span class="label-green">kind of OK</span>.
	* **fonts.google.com** – <span class="label-orange">privacy-ignorant</span> (_do I need to argue that using any resources from an advertising company and the biggest data-hoarder on the planet is at least ignorant?_).

**Note:** [uBlock Origin](https://github.com/gorhill/uBlock/) still finds <span class="label-red">ad trackers</span> on the page.

Seems they care more about their own privacy than mine.


### SourceHut

<p><img src="/static/2019/sourcehut-umatrix.png" class="full"></p>

* Uses **no JavaScript** – <span class="label-green">great</span>.
* **No cookies** – <span class="label-green">excellent</span>.
* **No third-party** resources on page – <span class="label-green">great</span>.

This is what I call hacker-friendly.


### GitLab

<p><img src="/static/2019/gitlab-umatrix.png" class="full"></p>

* Works **without JavaScript** – <span class="label-green">good</span>.
* Tries to set **1 cookie** without asking me first: <span class="label-yellow">not nice</span>.
* Third parties:
	* **cdnjs.cloudflare.com** – <span class="label-yellow">not privacy friendly</span>, bordering on <span class="label-orange">ignorant</span>
	* **cookiebot.com** – <span class="label-yellow">Not sure</span> what it does. Sounds evil, but probably just annoys you with a cookie consent banner
	* **fontawesome.com** – <span class="label-yellow">not privacy friendly</span>
	* **fonts.google.com** – <span class="label-orange">privacy-ignorant</span>
	* **bizible.com** – <span class="label-red">anti-privacy</span> "_Bizible offers an integrated **marketing analytics** platform for marketers to optimize their campaigns._"
	* **googletagmanager.com**:
		* <span class="label-danger">privacy-hostile</span>: Google: check. Google-**tag**-manager: "tag" means "**tracking pixel**".
		* <span class="label-danger">security risk</span>: Lets clueless **marketers** inject JavaScript from any third-parties _of their choosing_ into the page. From my experience, the third-parties can look pretty shady. You are at risk of getting viruses, crypto-miners and other crap.

I don't remember exactly what **GitLab** was using on the day **Microsoft** bought **GitHub**. Also I was using [NoScript][NoScript] at the time.

What I remember is that **GitLab.com** looked at least anti-privacy (probably due to **Bizible**). So I didn't switch to it. I see no big difference between **Microsoft** or **Google** plus shady third-parties hoarding my data.


### What you can do

What I did: I looked at [SourceHut][SourceHut] and payed [Drew DeVault](https://git.sr.ht/~sircmpwn/) the [$20](https://sourcehut.org/pricing/) he asked for. Currently I use it as a backup of my repos. I hope to use it for development and collaboration some day.

I have been using [uMatrix][uMatrix] for a few months now. It is developer-friendly, not user-friendly. Took some time until I got used to it. But now I enjoy it: I have granular control on _who_ runs _what_ on my computer.

[uMatrix][uMatrix] has also let me notice a **hacked website** I was visiting: I noticed that the page was trying to access resources from localhost (127.0.0.1):

<p><img src="/static/2019/siuntu-sekimas-umatrix.png" class="full"></p>

The page was on a site I didn't expect to be hacked: Lithuanian Post service. Not sure what the suspicious code was doing, but I reported it to the relevant authorities and it seems to be fixed.

[Firefox]:      https://www.mozilla.org/en-US/firefox/new/
[MsTelemetry]:  https://en.wikipedia.org/wiki/Criticism_of_Windows_10#Privacy_and_data_collection
[NoScript]:     https://noscript.net/
[SourceHut]:    https://sourcehut.org/
[uMatrix]:      https://addons.mozilla.org/en-US/firefox/addon/umatrix/
