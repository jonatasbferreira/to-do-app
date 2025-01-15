import "@hotwired/turbo-rails"
import "./controllers"
import Sortable from "sortablejs";

document.addEventListener("turbo:load", () => {
    const taskLists = document.querySelectorAll(".task-list");

    taskLists.forEach((list) => {
        const tasksContainer = list.querySelector(".task-container");

        if (tasksContainer) {
            Sortable.create(tasksContainer, {
                group: "tasks",
                animation: 150,
                onEnd: async (event) => {
                    const taskId = event.item.querySelector('[data-task-id]').getAttribute('data-task-id');
                    const newListId = event.to.dataset.listId;

                    try {
                        const response = await fetch(`/boards/${event.from.dataset.boardId}/lists/${event.from.dataset.listId}/tasks/${taskId}/move`, {
                            method: "PATCH",
                            headers: {
                                "Content-Type": "application/json",
                                "X-CSRF-Token": document.querySelector("[name='csrf-token']").content,
                            },
                            body: JSON.stringify({ new_list_id: newListId }),
                        });
                    } catch (error) {
                        throw new Error("Erro ao mover a tarefa");
                    }
                },
            });
        }
    });
});