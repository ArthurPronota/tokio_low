use tokio::runtime::Builder ;
use std::io ;

async fn fetch_network_request() ->u32 {
    60
}

fn main() ->io::Result<()>{
    
    // 1. Создаём runtime вручную
    let runtime = 
            Builder::new_multi_thread()
            .worker_threads(4)
            .thread_name("thread-one")
            .thread_stack_size(3 * 1024 * 1024)
            .build()?
            ;

    // 2. Запускаем задачу
    runtime.spawn(async {
        println!("{}", fetch_network_request().await) ;
    }) ;

    Ok(())
}
