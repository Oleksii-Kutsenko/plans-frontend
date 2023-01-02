<script lang="ts">
	import { user } from '$lib/store.ts';
	import { PUBLIC_API_ROOT } from '$env/static/public'

	let loginData = {
		email: '',
		password: ''
	};

	async function handleLogin(e) {
		e.preventDefault();

		let response;
	}

	console.log(PUBLIC_API_ROOT);
</script>

{#if $user}
	<nav>
		<a href="/">Home</a>
		<a href="/countries">Countries</a>
	</nav>

	<slot />
{:else}
	<label>Email: <input type="email" bind:value={loginData.email} /></label>
	<label>Password: <input type="password" bind:value={loginData.password} /></label>
	<button type="submit">Log In</button>
{/if}
