// 消息提示
export function showMessage(message = '提示内容', type = 'success', customClass = '') {
    return ElMessage({
        type: type,
        message,
        customClass,
    })
}

// 弹出确认框
export function showModel(content = '提示内容', type = 'warning', title = '') {
    return ElMessageBox.confirm(
        content,
        title,
        {
            confirmButtonText: '确定',
            cancelButtonText: '取消',
            type,
        }
    )
}