<template>
    <div class="register-main">
        <div class="flex justify-center mt-[50px]">
            <p class="text-[36px]">注册</p>
        </div>
        <form class="max-w-sm mx-auto" @submit.prevent="register">
            <div class="mb-5">
                <label for="username" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">用户名</label>
                <input v-model="username" type="text" id="username" name="username"
                    class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500 dark:shadow-sm-light"
                    required>
            </div>
            <div class="mb-5">
                <label for="password" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">登录密码</label>
                <input v-model="password" type="password" id="password" name="password"
                    :class="{ 'border-red-500': passwordError, 'border-green-500': passwordValid }"
                    class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500 dark:shadow-sm-light"
                    required>
                <p v-if="passwordError" class="text-red-500 text-sm mt-1">密码太短,请至少输入6个字符</p>
                <p v-if="passwordValid" class="text-green-500 text-sm mt-1">密码有效</p>
            </div>
            <div class="mb-5">
                <label for="confirmPassword"
                    class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">确认密码</label>
                <input v-model="confirmPassword" type="password" id="confirmPassword" name="confirmPassword"
                    :class="{ 'border-red-500': confirmPasswordError, 'border-green-500': confirmPasswordValid }"
                    class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500 dark:shadow-sm-light"
                    required>
                <p v-if="confirmPasswordError" class="text-red-500 text-sm mt-1">密码不匹配</p>
                <p v-if="confirmPasswordValid" class="text-green-500 text-sm mt-1">密码匹配</p>
            </div>
            <div class="flex items-start mb-5">
                <div class="flex items-center h-5">
                    <input v-model="acceptTerms" id="terms" type="checkbox" value=""
                        class="w-4 h-4 border border-gray-300 rounded bg-gray-50 focus:ring-3 focus:ring-blue-300 dark:bg-gray-700 dark:border-gray-600 dark:focus:ring-blue-600 dark:ring-offset-gray-800 dark:focus:ring-offset-gray-800"
                        required>
                </div>
                <label for="terms" class="ms-2 text-sm font-medium text-gray-900 dark:text-gray-300">阅读并接受
                    <a href="#" class="text-blue-600 hover:underline dark:text-blue-500">用户协议</a>
                    <span>&nbsp;和&nbsp;</span>
                    <a href="#" class="text-blue-600 hover:underline dark:text-blue-500">隐私政策</a>
                </label>
            </div>
            <button type="submit"
                class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">注册</button>
        </form>
    </div>
</template>

<script setup>
import { ref,watch } from 'vue'
import { registerUser } from '@/api/admin/user'
import { useRouter } from 'vue-router'
import { showMessage } from '@/utils/util'

const router = useRouter()
const username = ref('')
const password = ref('')
const confirmPassword = ref('')
const acceptTerms = ref(false)

const passwordError = ref(false);
const passwordValid = ref(false);
const confirmPasswordError = ref(false);
const confirmPasswordValid = ref(false);

watch(password, (newVal) => {
    if (newVal.length < 6) {
        passwordError.value = true;
        passwordValid.value = false;
    } else {
        passwordError.value = false;
        passwordValid.value = true;
    }
});

watch(confirmPassword, (newVal) => {
    if (newVal !== password.value) {
        confirmPasswordError.value = true;
        confirmPasswordValid.value = false;
    } else {
        confirmPasswordError.value = false;
        confirmPasswordValid.value = true;
    }
});
const register = async () => {
    // 验证通过后执行注册逻辑
    if (!passwordValid.value || !confirmPasswordValid.value || !acceptTerms.value) {
        // 处理未同意条款或者密码不匹配的逻辑
        return;
    }
    try {
        await registerUser(username.value, password.value, confirmPassword.value)
        showMessage("注册成功！")
        router.push('/login')
    } catch (error) {
        showMessage("注册失败,请重试！")
    }
}

</script>

<style></style>